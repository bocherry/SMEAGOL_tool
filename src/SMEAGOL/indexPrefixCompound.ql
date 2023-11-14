/**
 * @name Prefix index of compound indexes with strong index match
 * @description When an index is individually declared and is also a prefix of a compound index
 * @kind alert
 * @id indexPrefixCompound
 */
import javascript
import utils.schema_inference_internal

from MongoIndexDeclaration indexDecl
where 
    count(indexDecl.getAQualifiedIndexName()) = 1
    and
    exists( MongoIndexDeclaration otherIndexDecl | otherIndexDecl != indexDecl and 
        otherIndexDecl.getAQualifiedIndexName() = indexDecl.getAQualifiedIndexName() and 
        otherIndexDecl.getCollectionName() = indexDecl.getCollectionName() and 
        count(otherIndexDecl.getAQualifiedIndexName()) > 1)
select indexDecl, "This index is used in another compound index declaration. Consider removing this individual index"
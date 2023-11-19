/**
 * @name Uncovered queries Strong with strong index match
 * @description Indexed queries allow to speed up the process by only scanning the concerned index and not the entire collection
 * @kind alert
 * @id queryUncovered
 */
import javascript
import utils.queryOperator
import utils.schema_inference_internal

from Operator queryOperator
where 
    not isStronglyIndexed(queryOperator.getFullyQualifiedName(), queryOperator.getCollectionName()) and
    not queryOperator.getFullyQualifiedName() = "_id"
select queryOperator, "This query is not covered. Consider indexing the attribute/querying an indexed attribute"
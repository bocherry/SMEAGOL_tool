# Code smells definitions

## Case-insensitive queries without matching index

<b>Definition</b> : Using case-insensitive queries without matching (case-insensitive) indexes may lead to the failure to retrieve the intended data.

<b>Detection rule</b> : For a find query, checks whether a query is case-sensitive and checks if the related index is case-sensitive by checking its [colation](https://www.mongodb.com/docs/manual/reference/collation/) strength

## Index intersection rather than compound index

<b>Definition</b> : Using multiple separately indexed attributes can result in a performance decline compared to a compound index.

<b>Detection rule</b> : For a query, checks whether a query filter contains multiple filters attributes, more than one is indexed and no compound index declaration exists related to those indexes.

## Querying too much data

<b>Definition</b> : Not using every attribute retrieved by a query (i.e., specified in the [projection](https://www.mongodb.com/docs/manual/tutorial/project-fields-from-query-results/) part) can add unnecessary performance and memory overhead.

<b>Detection rule</b> : For a [find](https://www.mongodb.com/docs/manual/reference/method/db.collection.find/) query, infer the related collection attributes and restrict those not specified in the projection, checks if there is an access on the document for every returned attribute

## Negation in queries

<b>Definition</b> : A negation in a query can poorly impact performance as it results in a complete collection scan.

<b>Detection rule</b> : For a query, checks if a negation [operator](https://www.mongodb.com/docs/manual/reference/operator/query/) is used (which are $ne and $not)

## Uncovered queries

<b>Definition</b> : Querying an attribute that has not been indexed can result in a performance drop due to an entire collection scan (instead of a slower index scan).

<b>Detection rule</b> : For a query, checks whether an index corresponds the used attribute(s).

## Sorted Monkeys

<b>Definition</b> : Using a [\$push](https://www.mongodb.com/docs/manual/reference/operator/update/push/) operator alongside a [\$slice](https://www.mongodb.com/docs/manual/reference/operator/update/slice/) or [\$sort](https://www.mongodb.com/docs/manual/reference/operator/update/sort/) can result in performance drop as it replaces the whole array instead of updating it.

<b>Detection rule</b> : For an update query, checks whether a \$push operator is used and if a \$slice or \$sort is used in conjunction.

## Multiple Schemas in a file

<b>Definition</b> : Declaring multiple [Mongoose schemas](https://mongoosejs.com/docs/guide.html) inside a single file can decrease code readability.

<b>Detection rule</b> : For each file, checks if there is more than one Mongoose Schema declaration and both are defined as [model](<https://mongoosejs.com/docs/7.x/docs/api/mongoose.html#Mongoose.prototype.model()>) separately

## Using a Document only for id field

<b>Definition</b> : A document should almost never be used as an ID value. It is inefficient for the index mechanism.

<b>Detection rule</b> : For an insert query, checks if there is only one attribute, and this attribute is an \_id

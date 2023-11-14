/**
 * @name Using transactions
 * @description Using transactions is a bad design smells
 * @kind alert
 * @id usingTransactions
 */
import javascript
import utils.identified_call

from MethodCallExpr transactionCall
where 
    isAMongoCall(transactionCall) and
    transactionCall.getMethodName() = "withTransaction"
select transactionCall, "This is a transaction use, consider refactoring your schema as it is a bad design smell"
# Code smells instances example

## Index intersection rather compound index

- [Code link](https://github.com/HabitRPG/habitica/blob/aeef31d0d46bfd3ac207988ae71cb9b79e930ca7/website/server/models/challenge.js#L302)
- [Index Declaration](https://github.com/HabitRPG/habitica/blob/develop/migrations/docs/mongo-indexes.md)

## Querying too much data

- [Code link](https://github.com/nodemailer/wildduck/tree/ea24b9328b6984db841de86309f1712f100acb97/lib/prepare-search-filter.js#L28)

## Negation in queries

- [Code link](https://github.com/open-webrtc-toolkit/owt-server/blob/c5229d643b7891a375405d8da1177abe0aa65037/source/data_access/interface/roomInterface.js#L223)

## Uncovered queries

- [Code link](https://github.com/processing/p5.js-web-editor/blob/a1a5efd44f64f4a449f07379098dcdfe049558eb/server/controllers/user.controller.js#L201)
- [Index declaration](https://github.com/processing/p5.js-web-editor/blob/a1a5efd44f64f4a449f07379098dcdfe049558eb/server/models/user.js#L328)

## Sorted Monkeys

- [Code link](https://github.com/Countly/countly-server/tree/457fe1e7169ae0d6664532cab1fb0ccb8b4ebb1d/frontend/express/libs/members.js#L1017)

## Multiple Schemas in a file

- [Code link](https://github.com/HabitRPG/habitica/blob/aeef31d0d46bfd3ac207988ae71cb9b79e930ca7/website/server/models/message.js#L58) (mongoose.model is the method to export a Model)

## Using a document only for id field

- [Code link](https://github.com/Countly/countly-server/blob/457fe1e7169ae0d6664532cab1fb0ccb8b4ebb1d/plugins/crashes/install.js#L22)

ALTER  TABLE  `rest_satisfaction_comment`  ADD  COLUMN dialogueType  varchar(50) DEFAULT 'SINGLE' AFTER source ;

ALTER  TABLE  `rest_satisfaction_comment` ADD  COLUMN multiTurnDialogueId  varchar(36) DEFAULT '' AFTER sessionId ;

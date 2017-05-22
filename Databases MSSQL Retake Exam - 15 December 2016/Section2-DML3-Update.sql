Update Chats
set StartDate =
m.SentOn from Chats c
join Messages m on m.ChatId =c.Id
where StartDate > SentOn	
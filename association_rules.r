library(arules)
filename <- './Building_Permits.csv'
select_attr <- c("Current Status","Fire Only Permit","Supervisor District","Zipcode")
data2 <- read.csv(filename, header = T, sep=',')
select_data <- data.frame(data2$Current.Status, data2$Fire.Only.Permit,data2$Supervisor.District, data2$Zipcode)
write.csv(select_data,file = 'data.csv',sep = ',')
data_trans <- read.transactions('data.csv',format = "basket",sep=',')
rules=apriori(data_trans,parameter=list(support=0.05,confidence=0.3,minlen = 2,target="rules"))
inspect(sort(rules,by="support")[1:10])#查看前十条关联规�?
inspect(sort(rules,by="lift")[1:10])#查看 lift 前十条关联规�?

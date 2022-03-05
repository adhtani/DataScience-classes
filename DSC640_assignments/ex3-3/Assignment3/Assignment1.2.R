### Assignment 1.2
### DSC640
### Taniya Adhikari

df1 <- read_excel("hotdog-contest-winners.xlsm", sheet ="hot-dog-contest-winners")
head(df1)

### Bar Chart
df1 %>%
  group_by(Country) %>%
  summarise(count = n()) %>%
  ggplot(aes(x=reorder(Country, (-count)), y = count, fill=Country))+
  geom_bar(stat="identity", width=0.7)+
  scale_fill_brewer(palette="BuPu")+
  theme_classic()+ ylab("Winning Times")+
  xlab("Country")+
  theme(legend.position='none', plot.title = element_text(hjust = 0.5))+
  ggtitle("R - Bar Chart: Country's Winning Times")



df2 <- read_excel('hotdog-places.xlsm', sheet='hot-dog-places')
df2 <- as.data.frame(t(as.matrix(df2)))
df2$Year <- rownames(df2)
rownames(df2) <- c(0,1,2,3,4,5,6,7,8,9,10)
head(df2)

### Stacked Bar Chart
df2 %>% select(V3, V2, V1, Year) %>%
  pivot_longer(., cols = c(V3, V2, V1), names_to = "Var", values_to ="Val") %>%
  # Stacked barplot with multiple groups
  ggplot(aes(x=Year, y=Val, fill=Var)) +
  geom_bar(stat="identity")+
  geom_text(aes(label=Val), size = 3.5, position = position_stack(vjust = 0.5), color="white")+
  scale_fill_brewer(palette="Accent")+
  theme_classic()+ ylab("Year")+
  xlab("Places")+
  theme(legend.position="bottom", plot.title = element_text(hjust = 0.5))+
  ggtitle("R - Stacked Bar Chart: Hotdog's Places for Each Year")
df2 <- read_excel('hotdog-places.xlsm', sheet='hot-dog-places')
df2 <- as.data.frame(t(as.matrix(df2)))
df2$Year <- rownames(df2)
rownames(df2) <- c(0,1,2,3,4,5,6,7,8,9,10)
head(df2)
df2 %>% select(V3, V2, V1, Year) %>%
  pivot_longer(., cols = c(V3, V2, V1), names_to = "Var", values_to ="Val") %>%
  # Stacked barplot with multiple groups
  ggplot(aes(x=Year, y=Val, fill=Var)) +
  geom_bar(stat="identity")+
  geom_text(aes(label=Val), size = 3.5, position = position_stack(vjust = 0.5), color="white")+
  scale_fill_brewer(palette="Accent")+
  theme_classic()+ ylab("Year")+
  xlab("Places")+
  theme(legend.position="bottom", plot.title = element_text(hjust = 0.5))+
  ggtitle("R - Stacked Bar Chart: Hotdog's Places for Each Year")



df3 <- read_excel('obama-approval-ratings.xls', sheet='Sheet1')
head(df3)
df3 <- as.data.frame(t(as.matrix(df3)))
colnames(df3) <- df3[1,]
df3 <- df3[-1,]
colnames(df3) <- make.names(names(df3))
df3 <- as.data.frame(sapply(df3, as.numeric))
df3$Rating <- c("Approve", "Disapprove", "None")


### Pie Chart
bp<- ggplot(df3, aes(x="", y=Race.Relations, fill=Rating))+
  geom_bar(width = 1, stat = "identity")
pie <- bp + coord_polar("y", start=0) +
  geom_text(aes(label = paste0(round(Race.Relations), "%")), position= position_stack(vjust = 0.5), size=3.5)
pie + scale_fill_brewer(palette="Pastel1")+
  labs(x = NULL, y = NULL, fill = NULL, title = "R - Pie Chart: Approval Ratings for Race Relations")+
  theme_classic()+ theme(legend.position="right", axis.line = element_blank(),
                         axis.text = element_blank(),
                         axis.ticks = element_blank(),
                         plot.title = element_text(hjust = 0.5, color= "#666666"))


### Donut Chart
hsize<- 1.5
df3 <- df3 %>%
  mutate(x = hsize)
ggplot(df3, aes(x=hsize, y=Taxes, fill=Rating))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar(theta = "y")+
  geom_text(aes(label = paste0(round(Taxes), "%")), position= position_stack(vjust = 0.5), size=3.5) + xlim(c(0.2, hsize+0.5))+
  scale_fill_manual(values=c("#55DDE0", "#999999", "#F26419"))+
  labs(x = NULL, y = NULL, fill = NULL, title = "R - Donut Chart: Approval Ratings for Taxes")+
  theme_classic()+ theme(legend.position="right", axis.line = element_blank(),
                         axis.text = element_blank(),
                         axis.ticks = element_blank(),
                         plot.title = element_text(hjust = 0.5, color= "#666666"))
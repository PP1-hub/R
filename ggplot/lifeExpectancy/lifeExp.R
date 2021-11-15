library(ggplot2)
library(gapminder)
library(gganimate)

s

gapminder

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.7, show.legend = FALSE)+
  scale_colour_manual(values = country_colors)+
  scale_size(range = c(2, 12))+
  scale_x_log10()+
  facet_wrap(~continent)+
  labs(title = 'Year: 1952-2007', x = 'GDP per capita', y = 'Life expectancy')


ggsave('plot_gdpPercap_lifeExp_static.png', width = 8, height = 8)

#STATIC GRAPHIC
ggplot(gapminder,aes(gdpPercap, lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.7, show.legend = FALSE)+
  scale_colour_manual(values = country_colors)+
  scale_size(range = c(2, 12))+
  scale_x_log10()+
  facet_wrap(~continent, ncol=5 )+
  theme( plot.title = element_text(size = 20, face = "bold", colour = "black"),
         axis.title.x = element_text(size = 18, face = "bold", colour = "black"),
         axis.title.y = element_text(size = 18, face = "bold", colour = "black"),
         axis.text.x = element_text(size = 16, face = "bold", colour = "black"),
         axis.text.y = element_text(size = 16, face = "bold", colour = "black"),
         strip.text.x = element_text(size = 16, face = "bold", colour = "black"),
         plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm"))+
  labs(title = 'Year:1952 - 2007', x = 'GDP per capita', y = 'Life expectancy')

ggsave('plot_gdpPercap_lifeExp_static.png', width = 16, height = 4)

#Animation

p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.7, show.legend = FALSE)+
  scale_colour_manual(values = country_colors)+
  scale_size(range = c(2, 12))+
  scale_x_log10()+
  facet_wrap(~continent)+
  #Animating the plot
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y= 'Life expectancy')+
  transition_time(year)+
  ease_aes('linear')

animate(p1)
anim_save('plot_gdpPercap_lifeExp.gif')


#Customize
p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.7, show.legend = FALSE)+
  scale_colour_manual(values = country_colors)+
  scale_size(range = c(2, 12))+
  scale_x_log10()+
  facet_wrap(~continent, ncol=5) +
  theme(plot.title = element_text(size = 20, face = "bold", colour = "black"),
axis.title.x = element_text(size = 18, face = "bold", colour = "black"),
axis.title.y = element_text(size = 18, face = "bold", colour = "black"),
axis.text.x = element_text(size = 16, face = "bold", colour = "black"),
axis.text.y = element_text(size = 16, face = "bold", colour = "black"),
strip.text.x = element_text(size = 16, face = "bold", colour = "black"),
plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm"))+
  labs(title = 'Year:1952 - 2007', x = 'GDP per capita', y = 'Life expectancy')+
  translation_time(year)+
  ease_aes('linear')

animate(p1, width= 1500, height = 400)
anim_save('plot_gdpPercap_lifeExp.gif')
  


draw_plot2 <- function(data = NULL, draw_to_device = TRUE){
    # load helper functions with general_draw
    source('helper.R')
    
    # function drawing plot only, graphic device init is placed in helper.R functions
    plot_function <- function(mydata){
        plot(as.POSIXct(paste(mydata$Date, mydata$Time)), mydata$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
    }
    
    # calling the general function for drawing
    genereal_draw('plot2', plot_function = plot_function, data = data, draw_to_device = draw_to_device)
}
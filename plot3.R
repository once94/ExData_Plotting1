draw_plot3 <- function(data = NULL, draw_to_device = TRUE){
    # load helper functions with general_draw
    source('helper.R')
    
    # function drawing plot only, graphic device init is placed in helper.R functions
    plot_function <- function(mydata){
        datetime <- as.POSIXct(paste(mydata$Date, mydata$Time))
        
        # drawing plot
        plot(datetime, mydata$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
        lines(datetime, mydata$Sub_metering_2, col = 'red')
        lines(datetime, mydata$Sub_metering_3, col = 'blue')
        
        # drawing legend
        legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1), col = c('black', 'red', 'blue'))
    }
    
    # calling the general function for drawing
    genereal_draw('plot3', plot_function = plot_function, data = data, draw_to_device = draw_to_device)
}
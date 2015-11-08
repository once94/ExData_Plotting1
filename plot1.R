draw_plot1 <- function(data = NULL, draw_to_device = TRUE){
    # load helper functions with general_draw
    source('helper.R')
    
    # function drawing plot only, graphic device init is placed in helper.R functions
    plot_function <- function(mydata){
        hist(mydata$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
    }
    
    # calling the general function for drawing
    genereal_draw('plot1', plot_function = plot_function, data = data, draw_to_device = draw_to_device)
}
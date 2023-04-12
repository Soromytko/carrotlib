#include "Window.h"
#include <iostream>
#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

namespace carrotui
{
    Window::Window()
    {
        const char *msg = "Hesdfsllo, World!";

        Display *display = XOpenDisplay(nullptr);
        if (display == nullptr)
        {
            fprintf(stderr, "Cannot open display\n");
            exit(1);
        }

        int screen = DefaultScreen(display);
        XID window = XCreateSimpleWindow(display, RootWindow(display, screen), 10, 10, 300, 300, 1, BlackPixel(display, screen), WhitePixel(display, screen));


        XSelectInput(display, window, ExposureMask | KeyPressMask);
        XMapWindow(display, window);

        float c = 0;
        XEvent event;
        while (true)
        {
            XNextEvent(display, &event);

            if (event.type == Expose)
            {
                c += 1;
                XFillRectangle(display, window, DefaultGC(display, screen), c, 20, 10, 10);
                XDrawString(display, window, DefaultGC(display, screen), 10, 50, msg, strlen(msg));
            }
            else if (event.type == KeyPress)
            {
                break;
            }
            else if (event.type == ButtonPress)
            {
const char *m = "sdfsdffs, World!";
                XDrawString(display, window, DefaultGC(display, screen), 10, 50, m, strlen(m)); 
            }
        }
    }

    void Window::open()
    {

    }
}
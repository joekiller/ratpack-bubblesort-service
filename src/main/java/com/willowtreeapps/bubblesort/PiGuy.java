package com.willowtreeapps.bubblesort;

/**
 * Created by josephlawson on 12/22/15.
 */
public class PiGuy implements Runnable {
    private volatile boolean running = true;
    public double pi = 0.0;

    public void terminate() {
        running = false;
    }

    @Override
    public void run() {
        int m = 1;
        while (running) {
            pi += 4 * (Math.pow(-1, m - 1) / ((2 * m) - 1)); // I'm assuming this formula works
            m++;
        }
    }
}

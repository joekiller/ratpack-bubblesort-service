package com.willowtreeapps.bubblesort;

/**
 * User: tylerromeo
 * Date: 12/15/15
 * Time: 8:55 AM
 */

import ratpack.server.RatpackServer;

import java.util.ArrayList;
import java.util.List;

import static ratpack.jackson.Jackson.fromJson;
import static ratpack.jackson.Jackson.json;
import static ratpack.util.Types.listOf;

public class Main {

    private static Thread thread = null;
    private static PiGuy runnable = null;
    private static Boolean explode = false;

    public static void main(String... args) throws Exception {
        RatpackServer.start(server -> server
                .handlers(chain -> chain
                        .get(ctx -> ctx.render(healthcheck()))
                        .get("armbomb", ctx -> ctx.render(arm()))
                        .get("bakepie", ctx -> ctx.render(startPie()))
                        .get("stoppie", ctx -> ctx.render(String.valueOf(stopPie())))
                        .post("sort", ctx -> {
                            ctx.render(ctx.parse(fromJson(listOf(Integer.class))).map(i -> json(bubbleSort(i))));
                        })
                )
        );
    }

    private static String startPie() {
        runnable = new PiGuy();
        thread = new Thread(runnable);
        thread.start();
        return("Oven is blasting.");
    }

    private static Double stopPie() {
        if (thread != null) {
            runnable.terminate();
            try {
                thread.join();
            } catch (InterruptedException e) { }
            return runnable.pi;
        }
        return 0.0;
    }

    private static String healthcheck() throws InterruptedException {
        if (explode) {
            while (true) {
                Thread.sleep(Integer.MAX_VALUE);
            }
        }
        return "Sort Service is running";
    }

    private static String arm() {
        explode = true;
        return "All your base are belong to us.";
    }

    private static List<Integer> bubbleSort(List<Integer> list) {
        List<Integer> listToSort = new ArrayList<>(list);
        boolean changeMade;
        do {
            changeMade = false;
            for (int i = 0; i < listToSort.size() - 1; i++) {
                Integer val1 = listToSort.get(i);
                Integer val2 = listToSort.get(i + 1);
                if(val1 > val2) {
                    changeMade = true;
                    listToSort.set(i, val2);
                    listToSort.set(i + 1, val1);
                }
            }
        } while(changeMade);
        return listToSort;
    }
}

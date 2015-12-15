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
    public static void main(String... args) throws Exception {
        RatpackServer.start(server -> server
                .handlers(chain -> chain
                        .get(ctx -> ctx.render("Sort Service is running"))
                        .post("sort", ctx -> {
                            ctx.render(ctx.parse(fromJson(listOf(Integer.class))).map(i -> json(bubbleSort(i))));
                        })
                )
        );
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

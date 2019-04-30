package cn.feng;

import org.junit.Test;
import sun.rmi.runtime.Log;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by rf on 2019/3/24.
 */
public class ExecutorTest {
    @Test
    public void test() {
        System.out.println("hello");
        ExecutorService executor = Executors.newFixedThreadPool(5);
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                System.out.println("hello");
            }
        };
        executor.execute(runnable);
    }
}

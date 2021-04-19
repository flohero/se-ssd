package sax;

/**
 * Very easy, straight-forward way to measure time / memory usage for Java
 * applications
 *
 * @author Julian-Paul Haslinger (P22080)
 *
 */
public class EasyProfiler {

    private static long startDate;
    private static long endDate;
    private static boolean timeProfilingStarted = false;

    public static void StartTimeProfiling() {
        if (!timeProfilingStarted) {
            startDate = System.currentTimeMillis();
            timeProfilingStarted = true;
        }
    }

    public static void StopTimeProfiling() {
        endDate = System.currentTimeMillis();
        timeProfilingStarted = false;
    }

    /**
     *
     * @return the time difference in milliseconds
     */
    public static long Difference() {
        return (endDate - startDate);
    }

    /**
     *
     * @return the time difference in seconds
     */
    public static long TimeDifferenceInSeconds() {
        return Difference() / 1000;
    }

    private static long startMemory;
    private static long endMemory;
    private static boolean memoryProfilingStarted = false;

    public static void StartMemoryProfiling() {
        if (!memoryProfilingStarted) {
            startMemory = GetSystemUsedMemory();
            memoryProfilingStarted = true;
        }
    }

    private static long GetSystemUsedMemory() {
        return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
    }

    public static void StopMemoryProfiling() {
        endMemory = GetSystemUsedMemory();
        memoryProfilingStarted = false;
    }

    private static long MemoryUsageInBytes() {
        return (endMemory - startMemory);
    }

    public static long MemoryUsageInMB() {
        return MemoryUsageInBytes() / 1024 / 1024;
    }

    public static void Reset() {
        memoryProfilingStarted = false;
        timeProfilingStarted = false;
    }

}


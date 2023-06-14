using Serilog;

public static class Appl {
    public static Serilog.Core.Logger getLogger()
    {
        string logsDir = Environment.GetEnvironmentVariable("LOGS_DIR");
        var pageLogger = new Serilog.LoggerConfiguration()
            .WriteTo.File(Path.Join(logsDir, "pages.log"))
            .CreateLogger();
        return pageLogger;
    }
    public static Dictionary<string, object> appSettings;
}
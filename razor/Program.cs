using Serilog;
using Newtonsoft.Json;
DotNetEnv.Env.Load(); // Load the environment variables from the .env file
var builder = WebApplication.CreateBuilder(args);
var appPath = builder.Environment.ContentRootPath;
string json = File.ReadAllText(Path.Join(appPath, "appsettings.json"));
var appSettings = JsonConvert.DeserializeObject<Dictionary<string, object>>(json);
Appl.appSettings = appSettings;
string logsDir = Environment.GetEnvironmentVariable("LOGS_DIR");
Log.Logger = new LoggerConfiguration()
    .WriteTo.File(Path.Join(logsDir, "all.log"))
    .CreateLogger();
Log.Information("Starting web application");
builder.Host.UseSerilog(); // <-- Add this line
try
{
    builder.Services.AddRazorPages();
    var app = builder.Build();
    app.UseSerilogRequestLogging();
    if (!app.Environment.IsDevelopment())
    {
        app.UseExceptionHandler("/Error");

    }
    app.UseStaticFiles();
    app.UseRouting();
    app.UseAuthorization();
    app.MapRazorPages();
    app.Run();
}
catch (Exception ex)
{
    Log.Fatal(ex, "Application terminated unexpectedly");
}
finally
{
    Log.CloseAndFlush();
}

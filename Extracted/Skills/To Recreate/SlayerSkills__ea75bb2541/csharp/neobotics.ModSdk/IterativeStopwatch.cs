using System.Diagnostics;

namespace neobotics.ModSdk;

public class IterativeStopwatch : Stopwatch
{
	private double startMillis;

	private Logging Log = Logging.GetLogger();

	public long Iterations { get; private set; }

	public double IterationMicroseconds { get; private set; }

	public double TotalElapsedMicroseconds { get; private set; }

	public double IterationMilliseconds { get; private set; }

	public double TotalElapsedMilliseconds { get; private set; }

	public double AverageMicroseconds { get; private set; }

	public double AverageMilliseconds { get; private set; }

	public IterativeStopwatch()
	{
		Iterations = 0L;
	}

	public new void Start()
	{
		startMillis = Elapsed.TotalMilliseconds;
		base.Start();
	}

	public new void Stop()
	{
		if (IsRunning)
		{
			base.Stop();
			Iterations++;
			IterationMilliseconds = Elapsed.TotalMilliseconds - startMillis;
			IterationMicroseconds = IterationMilliseconds * 1000.0;
			TotalElapsedMilliseconds = Elapsed.TotalMilliseconds;
			TotalElapsedMicroseconds = Elapsed.TotalMilliseconds * 1000.0;
			AverageMilliseconds = TotalElapsedMilliseconds / (double)Iterations;
			AverageMicroseconds = TotalElapsedMicroseconds / (double)Iterations;
		}
	}

	public new void Reset()
	{
		startMillis = 0.0;
		Iterations = 0L;
		base.Reset();
	}

	public new void Restart()
	{
		startMillis = 0.0;
		Iterations = 0L;
		base.Restart();
	}
}

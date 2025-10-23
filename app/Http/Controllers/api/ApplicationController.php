<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;

use App\Models\Job;
use App\Models\Application;

class ApplicationController extends BaseController
{
    public function apply(Request $request, Job $job)
    {
        $request->validate(['cv' => 'required|file|mimes:pdf,doc,docx']);

        if (Application::where('job_id', $job->id)
                       ->where('freelancer_id', auth()->id())
                       ->exists()) {
            return $this->sendError('Already applied');
        }

        $path = $request->file('cv')->store('cvs');

        $application = Application::create([
            'job_id' => $job->id,
            'freelancer_id' => auth()->id(),
            'cv_path' => $path
        ]);

        return $this->sendResponse($application, 'Application created successfully');
    }

    public function index(Job $job)
    {
        $this->authorizeEmployer($job);
        $applications = $job->applications()->with('freelancer')->get();
        return $this->sendResponse($applications, 'Applications retrieved successfully');
    }

    private function authorizeEmployer(Job $job)
    {
        if ($job->user_id !== auth()->id()) {
            return $this->sendError('Unauthorized');
        }
    }
}


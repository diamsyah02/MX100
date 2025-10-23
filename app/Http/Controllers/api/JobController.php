<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Models\Job;

class JobController extends BaseController
{
    public function index()
    {
        $jobs = Job::where('status', 'published')->get();
        return $this->sendResponse($jobs, 'Jobs retrieved successfully');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'status' => 'in:draft,published'
        ]);

        $job = Job::create([
            'user_id' => auth()->id(),
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status ?? 'draft',
        ]);

        return $this->sendResponse($job, 'Job created successfully');
    }

    public function show(Job $job)
    {
        return $this->sendResponse($job, 'Job retrieved successfully');
    }

    public function update(Request $request, Job $job)
    {
        $this->authorizeJob($job);

        $job->update($request->only('title', 'description', 'status'));
        return $this->sendResponse($job, 'Job updated successfully');
    }

    public function destroy(Job $job)
    {
        $this->authorizeJob($job);
        $job->delete();
        return $this->sendResponse($job, 'Job deleted successfully');
    }

    private function authorizeJob(Job $job)
    {
        if ($job->user_id !== auth()->id()) {
            abort(403, 'Unauthorized');
        }
    }
}


<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ApiResponse extends JsonResource
{
    private string $message;
    private int $status = 200;

    /**
     * Create a new resource instance.
     *
     * @param mixed $resource
     */
    public function __construct($resource, string $message = 'Success', int $status = 200) {
        parent::__construct($resource);
        $this->message = $message;
        $this->status = $status;
    }

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'message' => $this->message,
            'data' => $this->resource,
        ];
    }

    public function withResponse($request, $response)
    {
        $response->setStatusCode($this->status);
    }
}

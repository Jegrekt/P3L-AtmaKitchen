<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ApiFailedResponse extends JsonResource
{
    private string $message;
    private int $statusCode;

    /**
     * Create a new resource instance.
     *
     * @param mixed $resource
     */
    public function __construct($resource, string $message = 'Failed', int $statusCode = 400) {
        parent::__construct($resource);
        $this->message = $message;
        $this->statusCode = $statusCode;
    }

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return parent::toArray($request);
    }

    public function withResponse($request, $response)
    {
        $response->setStatusCode($this->statusCode);
    }
}

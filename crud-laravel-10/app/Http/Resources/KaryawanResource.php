<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KaryawanResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'nama_karyawan' => $this->nama_karyawan,
            'tlpn_karyawan' => $this->tlpn_karyawan,
            'alamat' => $this->alamat,
            'gaji_karyawan' => $this->gaji_karyawan,
        ];
    }
}

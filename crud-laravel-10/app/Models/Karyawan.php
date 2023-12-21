<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    use HasFactory;

    protected $primaryKey = 'kd_karyawan';

    protected $fillable = [
        'nama_karyawan',
        'tlpn_karyawan',
        'alamat',
        'gaji_karyawan',
    ];
}

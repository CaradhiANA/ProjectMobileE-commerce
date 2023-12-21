@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card shadow-md rounded">
        <div class="card-body">
            <form action="{{ route('karyawan.update', [$karyawan]) }}" method="POST" class="my-2">
                @csrf
                @method('put')
                <div class="form-group mt-1">
                    <label for="nama_karyawan" class="form-label">Nama Karyawan</label>
                    <input id="nama_karyawan" name="nama_karyawan" type="text" class="form-control" value="{{ $karyawan->nama_karyawan }}">
                </div>
                <div class="form-group mt-1">
                    <label for="tlpn_karyawan" class="form-label">Telpon Karyawan</label>
                    <input id="tlpn_karyawan" name="tlpn_karyawan" type="text" class="form-control" value="{{ $karyawan->tlpn_karyawan }}">
                </div>
                <div class="form-group mt-1">
                    <label for="alamat" class="form-label">Alamat</label>
                    <input id="alamat" name="alamat" type="text" class="form-control" value="{{ $karyawan->alamat }}">
                </div>
                <div class="form-group mt-1">
                    <label for="gaji_karyawan" class="form-label">Gaji Karyawan</label>
                    <input id="gaji_karyawan" name="gaji_karyawan" type="number" class="form-control" value="{{ $karyawan->gaji_karyawan }}">
                </div>
                <br>
                <br>
                <div class="mt-2 d-flex gap-2">

                    <button type="submit" class="btn btn-md btn-primary">UPDATE</button>
                    <a href="{{ route('karyawan.index') }}" class="btn btn-md btn-secondary">BATAL</a>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

@endsection
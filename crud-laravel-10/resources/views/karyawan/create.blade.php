@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card shadow-md rounded">
        <div class="card-body">
            <h5>Tambah Karyawan</h5>
            <form action="{{ route('karyawan.store') }}" method="POST" class="my-2">
                @csrf
                <div class="form-group mt-1">
                    <label for="nama_karyawan" class="form-label">Nama Karyawan</label>
                    <input id="nama_karyawan" name="nama_karyawan" type="text" class="form-control" value="{{ old('nama_karyawan') }}">
                </div>
                <div class="form-group mt-1">
                    <label for="tlpn_karyawan" class="form-label">Telpon Karyawan</label>
                    <input id="tlpn_karyawan" name="tlpn_karyawan" type="text" class="form-control" value="{{ old('tlpn_karyawan') }}">
                </div>
                <div class="form-group mt-1">
                    <label for="alamat" class="form-label">Alamat Karyawan</label>
                    <input id="alamat" name="alamat" type="text" class="form-control" value="{{ old('alamat') }}">
                </div>
                <div class="form-group mt-1">
                    <label for="gaji_karyawan" class="form-label">Gaji Karyawan</label>
                    <input id="gaji_karyawan" name="gaji_karyawan" type="number" class="form-control" value="{{ old('gaji_karyawan') }}">
                </div>
                <br>
                <br>

                <div class="mt-2 d-flex gap-2">
                    <button type="submit" class="btn btn-md btn-success">CREATE</button>
                    <button type="reset" class="btn btn-md btn-warning">RESET</button>
                    <a href="{{ route('karyawan.index') }}" class="btn btn-md btn-secondary">BATAL</a>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

@endsection
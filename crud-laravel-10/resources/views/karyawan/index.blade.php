@extends('layout.master')
@section('content')
<div class="col py-3">
    <div>
        <h3 class="text-center my-4">Data Karyawan</h3>
    </div>
    <div class="card shadow-md rounded">
        <div class="card-body">
            <a href="{{ route('karyawan.create')}}" class="btn btn-md btn-success mb-3">+ TAMBAH DATA</a>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">NAMA</th>
                        <th scope="col">TELPON KARYAWAN</th>
                        <th scope="col">ALAMAT</th>
                        <th scope="col">GAJI KARYAWAN</th>
                        <th scope="col">AKSI</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($karyawans as $karyawan)
                    <tr>
                        <td>{{ $karyawan->nama_karyawan }}</td>
                        <td>{{ $karyawan->tlpn_karyawan }}</td>
                        <td>{{ $karyawan->alamat }}</td>
                        <td>{{ $karyawan->gaji_karyawan }}</td>
                        <td>
                            <div class="flex gap-3">
                                <a href="{{  route('karyawan.edit', [$karyawan]) }}" class="d-inline btn btn-sm btn-primary">EDIT</a>
                                <form onsubmit="return confirm('Apakah Anda Yakin ?');" action="{{ route('karyawan.destroy', [$karyawan]) }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger">HAPUS</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <div class="alert alert-danger">
                        Data Post belum Tersedia.
                    </div>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    @endsection
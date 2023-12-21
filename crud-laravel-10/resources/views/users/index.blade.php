@extends('layout.master')
@section('content')
<div class="col py-3">
    <div>
        <hr>
        <h3 class="text-center my-4">Data User</h3>
        <hr>
        <hr>
    </div>
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <a href="{{ route('users.create') }}" class="btn btn-md btn-success mb-3">+ TAMBAH DATA</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">USERNAME</th>
                        <th scope="col">NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">AKSI</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($users as $user)
                        <tr>
                            <td>{{ $user->username }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td class="text-center">
                                <form onsubmit="return confirm('Apakah Anda Yakin ?');" action="{{ route('users.destroy', $user->id) }}" method="POST">
                                    <a href="{{ route('users.edit', $user->id) }}" class="btn btn-sm btn-primary">EDIT</a>
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger">HAPUS</button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="text-center">
                                <div class="alert alert-danger">
                                    Data User belum Tersedia.
                                </div>
                            </td>
                        </tr>
                    @endforelse

                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <form action="{{ route('users.update', $user->id) }}" method="POST" enctype="multipart/form-data">

                @csrf
                @method('PUT') <!-- Use PUT method for update -->

                <div class="form-group">
                    <label class="font-weight-bold">Username</label>
                    <input type="text" class="form-control" name="username" value="{{$user->username}}">
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Name</label>
                    <input type="text" class="form-control" name="name" value="{{$user->name}}">
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Email</label>
                    <input type="email" class="form-control" name="email" value="{{$user->email}}">
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Password</label>
                    <input type="password" class="form-control" name="password" value="{{$user->password}}">
                </div>
                <br>
                <br>

                <button type="submit" class="btn btn-md btn-primary">UPDATE</button>
                <a href="{{ route('users.index') }}" class="btn btn-md btn-secondary">BATAL</a>
            </form>
        </div>
    </div>
</div>
@endsection
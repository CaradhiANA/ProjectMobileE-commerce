@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <form action="{{ route('reviews.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="product_id" class="font-weight-bold">Product</label>
                    <select name="product_id" id="product_id" class="form-select">
                        @foreach($products as $product)
                        <option value="{{$product->id}}">{{$product->nama}}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="user_id" class="font-weight-bold">User</label>
                    <select name="user_id" id="user_id" class="form-select">
                        @foreach($users as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Comments</label>
                    <textarea class="form-control @error('comments') is-invalid @enderror" name="text" placeholder="Masukkan Comments"></textarea>

                    @error('comments')
                    <div class="alert alert-danger mt-2">
                        {{ $message }}
                    </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Star</label>
                    <select class="form-control @error('rating') is-invalid @enderror" name="rating">
                        <option value="" disabled>Pilih Star Rating</option>
                        @for ($i = 1; $i <= 5; $i++) <option value="{{ $i }}">{{ $i }}</option>
                            @endfor
                    </select>

                    @error('rating')
                    <div class="alert alert-danger mt-2">
                        {{ $message }}
                    </div>
                    @enderror
                </div>
                <br>
                <br>

                <button type="submit" class="btn btn-md btn-primary">SIMPAN</button>
                <button type="reset" class="btn btn-md btn-warning">RESET</button>
                <a href="{{ route('reviews.index') }}" class="btn btn-md btn-secondary">BATAL</a>

            </form>
        </div>
    </div>
</div>
@endsection

<?php

namespace App\Http\Controllers;

//import Model "Post
use App\Models\Post;

//return type View
use Illuminate\View\View;

use Illuminate\Http\RedirectResponse;

//import Facade "Storage"
use Illuminate\Support\Facades\Storage;

use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * produk
     *
     * @return View
     */
    public function index(): View
    {
        //get posts
        $posts = Post::latest()->paginate(5);

        //render view with posts
        return view('posts.produk', compact('posts'));
    }
    /**
     * create
     *
     * @return View
     */
    public function create(): View
    {
        return view('posts.create');
    }

    /**
     * store
     *
     * @param  mixed $request
     * @return RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        //validate form
        $this->validate($request, [
            'image'   => 'required|image|mimes:jpeg,jpg,png|max:2048',
            'nama'    => 'required|min:5',
            'jenis'   => 'required|min:10',
            'harga'   => 'required',
            'stock'   => 'required',
            'kadaluarsa'   => 'required'
        ]);

        //upload image
        $image = $request->file('image');
        $image->storeAs('public/posts', $image->hashName());

        //create post
        Post::create([
            'image'   => $image->hashName(),
            'nama'    => $request->nama,
            'jenis'   => $request->jenis,
            'harga'   => $request->harga,
            'stock'   => $request->stock,
            'kadaluarsa'   => $request->kadaluarsa
        ]);

        //redirect to produk
        return redirect('posts')->with(['success' => 'Data Berhasil Disimpan!']);
    }
    /**
     * show
     *
     * @param  mixed $id
     * @return View
     */
    public function show(string $id): View
    {
        //get post by ID
        $post = Post::findOrFail($id);

        //render view with post
        return view('posts.show', compact('post'));
    }
    /**
     * edit
     *
     * @param  mixed $id
     * @return View
     */
    public function edit(string $id): View
    {
        //get post by ID
        $post = Post::findOrFail($id);

        //render view with post
        return view('posts.edit', compact('post'));
    }
    
    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $id
     * @return RedirectResponse
     */
    public function update(Request $request, $id): RedirectResponse
    {
        //validate form
        $this->validate($request, [
            'image'   => 'image|mimes:jpeg,jpg,png|max:2048',
            'nama'    => 'required|min:5',
            'jenis'   => 'required|min:10',
            'harga'   => 'required',
            'stock'   => 'required',
            'kadaluarsa'   => 'required'
        ]);

        //get post by ID
        $post = Post::findOrFail($id);

        //check if image is uploaded
        if ($request->hasFile('image')) {

            //upload new image
            $image = $request->file('image');
            $image->storeAs('public/posts', $image->hashName());

            //delete old image
            Storage::delete('public/posts/'.$post->image);

            //update post with new image
            $post->update([
                'image'   => $image->hashName(),
                'nama'    => $request->nama,
                'jenis'   => $request->jenis,
                'harga'   => $request->harga,
                'stock'   => $request->stock,
                'kadaluarsa'   => $request->kadaluarsa
            ]);

        } else {

            //update post without image
            $post->update([
                'nama'    => $request->nama,
                'jenis'   => $request->jenis,
                'harga'   => $request->harga,
                'stock'   => $request->stock,
                'kadaluarsa'   => $request->kadaluarsa
            ]);
        }

        //redirect to produk
        return redirect('posts')->with(['success' => 'Data Berhasil Diubah!']);
    }
    /**
     * destroy
     *
     * @param  mixed $post
     * @return void
     */
    public function destroy($id): RedirectResponse
    {
        //get post by ID
        $post = Post::findOrFail($id);

        //delete image
        Storage::delete('public/posts/'. $post->image);

        //delete post
        $post->delete();

        //redirect to produk
        return redirect('posts')->with(['success' => 'Data Berhasil Dihapus!']);
    }
}
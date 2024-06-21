<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class DetailHamper
 *
 * @property int $id
 * @property int $id_hampers
 * @property int $id_produk
 * @property int $qty
 *
 * @property Produk $produk
 *
 * @package App\Models
 */
class DetailHamper extends Model
{
	protected $table = 'detail_hampers';
	public $timestamps = false;

	protected $casts = [
		'id_hampers' => 'int',
		'id_produk' => 'int',
		'qty' => 'int'
	];

	protected $fillable = [
		'id_hampers',
		'id_produk',
		'qty'
	];

	public function produk()
	{
		return $this->belongsTo(Produk::class, 'id_produk');
	}

	public function parent_hampers()
	{
		return $this->belongsTo(Produk::class, 'id_hampers');
	}
}

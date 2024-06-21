<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PromoPoin
 * 
 * @property int $id
 * @property string $nama
 * @property Carbon $tanggal_mulai
 * @property Carbon $tanggal_selesai
 * @property float $kelipatan
 *
 * @package App\Models
 */
class PromoPoin extends Model
{
	protected $table = 'promo_poin';
	public $timestamps = false;

	protected $casts = [
		'tanggal_mulai' => 'datetime',
		'tanggal_selesai' => 'datetime',
		'kelipatan' => 'float'
	];

	protected $fillable = [
		'nama',
		'tanggal_mulai',
		'tanggal_selesai',
		'kelipatan'
	];
}

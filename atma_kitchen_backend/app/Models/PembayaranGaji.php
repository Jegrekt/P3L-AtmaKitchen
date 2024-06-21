<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class PembayaranGaji
 * 
 * @property int $id
 * @property int $id_pegawai
 * @property int $honor_harian
 * @property int $reward
 * @property int $total_gaji
 * @property string $tanggal
 * 
 * @property Pegawai $pegawai
 *
 * @package App\Models
 */
class PembayaranGaji extends Model
{
	protected $table = 'pembayaran_gaji';
	public $timestamps = false;

	protected $casts = [
		'id_pegawai' => 'int',
		'honor_harian' => 'int',
		'reward' => 'int',
		'total_gaji' => 'int'
	];

	protected $fillable = [
		'id_pegawai',
		'honor_harian',
		'reward',
		'total_gaji',
		'tanggal'
	];

	public function pegawai()
	{
		return $this->belongsTo(Pegawai::class, 'id_pegawai');
	}
}

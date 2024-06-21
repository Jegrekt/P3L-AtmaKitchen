<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class User
 *
 * @property int $id
 * @property string $name
 * @property string $role
 * @property string|null $username
 * @property string|null $password
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * @property Carbon|null $last_login_at
 *
 * @property Customer $customer
 * @property Pegawai $pegawai
 * @property Collection|Token[] $tokens
 *
 * @package App\Models
 */
class User extends Authenticatable
{
	use HasApiTokens;

	protected $table = 'users';

	protected $casts = [
		'last_login_at' => 'datetime',
		'password' => 'hashed'
	];

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'name',
		'role',
		'username',
		'password',
		'last_login_at'
	];

	public function customer()
	{
		return $this->hasOne(Customer::class, 'id_user');
	}

	public function pegawai()
	{
		return $this->hasOne(Pegawai::class, 'id_user');
	}

	public function role_data()
	{
		return $this->hasOne(Role::class, 'id', 'role');
	}
}

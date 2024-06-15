<?php

// ** Database settings ** //

/** The name of the database for WordPress */
define( 'DB_NAME', 'MDB_DB_NAME' );

/** Database username */
define( 'DB_USER', 'MDB_USER_NAME' );

/** Database password */
define( 'DB_PASSWORD', 'MDB_USER_PASS' );

/** Database hostname */
define( 'DB_HOST', 'MDB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'WP_AUTH_KEY');
define('SECURE_AUTH_KEY',  'WP_SECURE_A_KEY');
define('LOGGED_IN_KEY',    'WP_LOGGED_IN_KEY');
define('NONCE_KEY',        'WP_NONCE_KEY');
define('AUTH_SALT',        'WP_AUTH_SALT');
define('SECURE_AUTH_SALT', 'WP_SECURE_A_SALT');
define('LOGGED_IN_SALT',   'WP_LOGGED_IN_SALT');
define('NONCE_SALT',       'WP_NONCE_SALT');

/**
 * WordPress database table prefix.
 */
$table_prefix = 'wp_';

/**
 * WordPress debugging mode.
 */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
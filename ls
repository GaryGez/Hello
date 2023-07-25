<?php
/*
Plugin Name: External API Integration
Description: Integrates an external API to display data on a WordPress page.
Version: 1.0
Author: Your Name
*/

// Enqueue the JavaScript file to handle AJAX requests
function external_api_integration_scripts() {
    wp_enqueue_script('external-api', plugin_dir_url(__FILE__) . 'js/external-api.js', array('jquery'), '1.0', true);
}
add_action('wp_enqueue_scripts', 'external_api_integration_scripts');

// Create a shortcode to display the API data on a WordPress page
function display_api_data_shortcode($atts) {
    $atts = shortcode_atts(array(
        'api_endpoint' => 'https://api.example.com/data', // Replace this with your API endpoint URL
    ), $atts);

    $api_response = wp_remote_get($atts['api_endpoint']);

    if (is_wp_error($api_response)) {
        return 'Error fetching data from the API.';
    }

    $data = wp_remote_retrieve_body($api_response);

    // Process the API response if needed
    // For example, if the API returns XML data, you can directly display it
    // Or, you may need to parse the JSON response and convert it to XML

    return $data;
}
add_shortcode('api_data', 'display_api_data_shortcode');



jQuery(document).ready(function($) {
    // AJAX request to fetch and display API data
    $.ajax({
        url: ajaxurl,
        type: 'post',
        data: {
            action: 'get_api_data',
        },
        success: function(response) {
            $('#api-data-container').html(response);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.error('Error fetching API data.');
        }
    });
});



// Handle AJAX request to fetch API data
function get_api_data() {
    $api_endpoint = 'https://api.example.com/data'; // Replace this with your API endpoint URL

    $api_response = wp_remote_get($api_endpoint);

    if (is_wp_error($api_response)) {
        wp_send_json('Error fetching data from the API.');
    }

    $data = wp_remote_retrieve_body($api_response);

    // Process the API response if needed
    // For example, if the API returns XML data, you can directly display it
    // Or, you may need to parse the JSON response and convert it to XML

    wp_send_json($data);
}
add_action('wp_ajax_get_api_data', 'get_api_data');
add_action('wp_ajax_nopriv_get_api_data', 'get_api_data');



// Handle AJAX request to fetch API data
function get_api_data() {
    $api_endpoint = 'https://api.example.com/data'; // Replace this with your API endpoint URL

    $api_response = wp_remote_get($api_endpoint);

    if (is_wp_error($api_response)) {
        wp_send_json('Error fetching data from the API.');
    }

    $data = wp_remote_retrieve_body($api_response);

    // Process the API response if needed
    // For example, if the API returns XML data, you can directly display it
    // Or, you may need to parse the JSON response and convert it to XML

    wp_send_json($data);
}
add_action('wp_ajax_get_api_data', 'get_api_data');
add_action('wp_ajax_nopriv_get_api_data', 'get_api_data');



[api_data]
<div id="api-data-container"></div>



jQuery(document).ready(function($) {
    var username = 'your_username'; // Replace with your API username
    var password = 'your_password'; // Replace with your API password

    // Base64 encode the credentials
    var credentials = btoa(username + ':' + password);

    // AJAX request to fetch and display API data
    $.ajax({
        url: ajaxurl,
        type: 'post',
        data: {
            action: 'get_api_data',
        },
        beforeSend: function(xhr) {
            // Set the Authorization header with the encoded credentials
            xhr.setRequestHeader('Authorization', 'Basic ' + credentials);
        },
        success: function(response) {
            $('#api-data-container').html(response);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.error('Error fetching API data.');
        }
    });
});




// Handle AJAX request to fetch API data
function get_api_data() {
    $api_endpoint = 'https://api.example.com/data'; // Replace this with your API endpoint URL
    $username = 'your_username'; // Replace with your API username
    $password = 'your_password'; // Replace with your API password

    // Set up the authorization header with the credentials
    $authorization = base64_encode($username . ':' . $password);
    $headers = array(
        'Authorization' => 'Basic ' . $authorization,
    );

    $api_response = wp_remote_get($api_endpoint, array(
        'headers' => $headers,
    ));

    if (is_wp_error($api_response)) {
        wp_send_json('Error fetching data from the API.');
    }

    $data = wp_remote_retrieve_body($api_response);

    // Process the API response if needed
    // For example, if the API returns XML data, you can directly display it
    // Or, you may need to parse the JSON response and convert it to XML

    wp_send_json($data);
}
add_action('wp_ajax_get_api_data', 'get_api_data');
add_action('wp_ajax_nopriv_get_api_data', 'get_api_data');



use serde::Deserialize;

#[derive(Deserialize)]
struct CatImage {
    url: String,
}

#[tokio::main]
async fn main() {
    let respons = reqwest::get("https://api.thecatapi.com/v1/images/search")
        .await
        .unwrap();
    if !respons.status().is_success() {
        panic!("Request failed with HTTP {}", respons.status());
    }

    let images: Vec<CatImage> = respons.json().await.unwrap();
    let image = images
        .first()
        .expect("Cat api should return at least one image");
    println!("Image is at: {}", image.url);
}

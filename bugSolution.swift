func myFunc(param: String) -> String {
    guard let url = URL(string: param) else {
        return "Invalid URL"
    }
    do {
        let (data, response) = try URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            if let response = response as? HTTPURLResponse {
                return "Server error: \(httpResponse.statusCode)"
            } else {
                return "Server error: Unknown"
            }
        }
        return String(data: data, encoding: .utf8) ?? "Error decoding data"
    } catch {
        return "Error reading URL: \(error)"
    }
} 
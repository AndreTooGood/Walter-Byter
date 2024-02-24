import { useEffect, useState } from "react";
import { createClient } from "@supabase/supabase-js";
import LandingPage from "./LandingPage";

const supabase = createClient("https://dwqoafqzkaumholazfea.supabase.co", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR3cW9hZnF6a2F1bWhvbGF6ZmVhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3NzA1NTYsImV4cCI6MjAyNDM0NjU1Nn0.QRYIRMXFS53mgzQw8hQc49UmtsUxbu9Z08IGLLR3-U8");

function App() {
  const [countries, setCountries] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    getCountries();
  }, []);

  async function getCountries() {
    try {
      const { data, error } = await supabase.from("countries").select();
      if (error) {
        throw error;
      }
      setCountries(data);
    } catch (error) {
      setError(error.message);
    }
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div className="App">
    <LandingPage />
    <ul>
        {countries.map((country) => (
          <li key={country.name}>{country.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;

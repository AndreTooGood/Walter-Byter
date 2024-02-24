import React, { useEffect, useState } from 'react';
import { createClient } from '@supabase/supabase-js';

const supabase = createClient("https://dwqoafqzkaumholazfea.supabase.co", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR3cW9hZnF6a2F1bWhvbGF6ZmVhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3NzA1NTYsImV4cCI6MjAyNDM0NjU1Nn0.QRYIRMXFS53mgzQw8hQc49UmtsUxbu9Z08IGLLR3-U8");

function UserListPage() {
  const [clients, setClients] = useState([]);
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchData();
  }, []);

  async function fetchData() {
    try {
      // Fetch data from the clients table
      const { data: clientsData, error: clientsError } = await supabase.from("clients").select("*");
      if (clientsError) {
        throw clientsError;
      }
      setClients(clientsData);

      // Fetch data from the orders table
      const { data: ordersData, error: ordersError } = await supabase.from("orders").select("*");
      if (ordersError) {
        throw ordersError;
      }
      setOrders(ordersData);

      setLoading(false);
    } catch (error) {
      setError(error.message);
      setLoading(false);
    }
  }

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h2>Clients</h2>
      <ul>
        {clients.map((client) => (
          <li key={client.id}>{client.name}</li>
        ))}
      </ul>
      <h2>Orders</h2>
      <ul>
        {orders.map((order) => (
          <li key={order.id}>{order.product}</li>
        ))}
      </ul>
    </div>
  );
}

export default UserListPage;

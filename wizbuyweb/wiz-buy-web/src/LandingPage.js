import React from 'react';
import { Link } from 'react-router-dom';
import './LandingPage.css';

const LandingPage = () => {
  return (
    <div>
      {/* Header */}
      <header>
        <nav>
          <ul>
            <li><a href="#features">Features</a></li>
            <li><a href="#pricing">Pricing</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </nav>
      </header>

      {/* Hero Section */}
      <section id="hero">
        <h1>Welcome to <span>Wizbuy</span></h1>
        <img src="/wizbuydarktrans.png" alt="Wizbuy Logo" />
        <p>A simple and powerful solution for small-scale offline retailers</p>
        <button>Get Started</button>
      </section>

      {/* Features Section */}
      <section id="features">
        <h2>Features</h2>
        <ul>
          <li>Easy product management</li>
          <li>Secure online transactions</li>
          <li>Inventory tracking</li>
        </ul>
      </section>

      {/* Pricing Section */}
      <section id="pricing">
        <h2>Pricing</h2>
        <p>Choose a plan that fits your business needs</p>
        <ul>
          <li>Basic - $XX/month</li>
          <li>Pro - $XX/month</li>
          <li>Enterprise - Contact us for pricing</li>
        </ul>
      </section>

      {/* Contact Section */}
      <section id="contact">
        <h2>Contact Us</h2>
        <p>Have questions? Reach out to us at arunsanyals@gmail.com</p>
      </section>
      
      <section id="supabase">
        <p>Click below to view the list of client diagnostics:</p>
        <Link to="/userlist">View Now</Link>
      </section>

      {/* Footer */}
      <footer>
        <p>&copy; 2024 Wizbuy. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default LandingPage;
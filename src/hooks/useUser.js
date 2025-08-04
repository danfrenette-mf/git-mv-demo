// useUser Hook
import { useState, useEffect } from 'react';

export function useUser() {
  const [user, setUser] = useState(null);
  
  useEffect(() => {
    // Simulate API call
    setUser({ name: 'John Doe', id: '123' });
  }, []);
  
  return user;
}
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { API_URL } from './config';
import './App.css';
interface IUser {
    id: number;
    name: string;
    email: string;
}

const App: React.FC = () => {
    const [users, setUsers] = useState<IUser[]>([]);

    useEffect(() => {
        axios.get(`${API_URL}/users`, {
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then((response) => setUsers(response.data))
            .catch((error) => console.error(error));
    }, []);

    return (
        <div className="container">
            <h1>Список пользователей</h1>
            <div className="user-list">
                {users.map((user) => (
                    <div key={user.id} className="user-card">
                        <h2>{user.name}</h2>
                        <p>{user.email}</p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default App;

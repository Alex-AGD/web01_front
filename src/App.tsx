import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { API_URL } from './config';

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
        <div>
            <h1>Список пользователей</h1>
            <ul>
                {users.map((user) => (
                    <li key={user.id}>
                        Имя пользователя: {user.name}
                        <br/>
                        Email пользователя: {user.email}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default App;

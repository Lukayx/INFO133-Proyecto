import {Pool} from 'pg';

let conn: any

if (!conn){
conn = new Pool({
        user: 'postgres',
        password: 'mord3lona',
        host : 'localhost',
        port : 5432,
        database: 'peluq'
    }
    )
}
export {conn}
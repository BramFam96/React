# Basic React Component
All react apps use a centralized index.html
demo/index.html
```html
<!DOCTYPE html>
<html>
	<body>
		<h1>Demo: Hello</h1>

		<div id="root"><!-- component will go in this div --></div>

		<script src="https://unpkg.com/react/umd/react.development.js"></script>
		<script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>

		<script src="https://unpkg.com/babel-standalone"></script>

		<script src="index.js" type="text/jsx"></script>
	</body>
</html>
```
Components are created an inserted in index.jsx
```jsx
// Component
const Hello = () => {
	return (
		<p>
			Hello World!
			)}
		</p>
	)
}
// Render Call
ReactDOM.render(
	<Hello />,
	document.getElementById('root')
)
```
Things to note:  
- props are immutable at component level
- props can be strings or JSX expressions
  - non-strings must escape JSX with **{}**
# Basic Prop Looping
JSX easily handles list rendering
```jsx
const TodoList = () => {
  const todos = [
    <li>Gather Dishes</li>
    <li>Wash Dishes</li>
    <li>Dry Dishes</li>
  ]
  return (
    <div>
      <h4>Todo List</h4>
      <ul>{todos}</ul>
    </div>
  )
}
```
JSX automatically iterates when given a list.  
To better control formatting we map
```jsx
const Hello = (props) => {
	return (
		<p>
			Hello,
			{props.names.map((name) => 
				<p>{name}</p>
			)}
		</p>
	)
}

ReactDOM.render(
	<Hello names={['Matt', 'James', 'DeShaun']} />,
	document.getElementById('root')
)
```
Commonly we map <li>s within <ul/ol>s  
React will automatically iterate and place items in DOM.  
This flexibility allows us to abstract templating to the prop values themselves.  
# React App Structure
Components are split from rendering function
```jsx
// directory/Hello.js
const Hello = (props) => {
	return (
		<p>
			Hello,
			{props.names.map((name) => 
				<p>{name}</p>
			)}
		</p>
	)
}
// directory/index.js
const App = () => (
	<div>
		<Hello name='Matt'/>
	</div>
)
ReactDOM.render(<App />, document.getElementById('root'))
```
*These need to be connect in index.html*
```html
<!-- directory/index/html -->
	<body>
		<h1>Demo: Hello</h1>

		<div id="root"><!-- component will go in this div --></div>

		<script src="https://unpkg.com/react/umd/react.development.js"></script>
		<script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>

		<script src="https://unpkg.com/babel-standalone"></script>
<!-- Index.js MUST be called last -->
		<script src="Hello.js" type="text/jsx"></script>
		<script src="index.js" type="text/jsx"></script>
	</body>
```
# Conditionals
Functional components can return the following:
- a **single valid** DOM object (return <div></div>)
- an **array** of DOM Objects (advanced)
- **null/undefined**

React renders nothing when given null/undefined values.  
Additionally the mere existence of a prop makes it truthy.  
```jsx
// Ternary
const Animal = (props) => {
  return (
    <ul>
        <li>{props.name}</li>
        <li>{props.species}</li>
        <li>{props.friendly ? '\u2714' : 	'&#8864;' </li>
    </ul>
)
}
```
Validates true even if animal is passed a blank 'friendly' att  
Ternaries can get sloppy. If we have more logic it's abstraction time!  
```jsx
// Check condition with seperate boolean variable
const winner = props.s1 === props.s2 && props.s2 === props.s3;
// winner is true or false
<p>You {winner ? "win!" : "lose!"}</p>
```
Realistic example
```jsx
// Start with initial state
const 
const isLoggedIn = this.state.isLoggedIn;
// Define logic
let button;
if (isLoggedIn) {
  button = <LogoutButton onClick={this.handleLogoutClick}/>;
} else {
  button = <LoginButton onClick={this.handleLoginClick}/>;
}
// create component
return (
  <div>
    <Greeting isLoggedIn={isLoggedIn}/>
    {button}
  </div>
)
```
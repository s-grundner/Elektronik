---
defines-react-components: true
---

```jsx:component:ColorfulClock
const [date, setDate] = useState(new Date)

useEffect(()=>{
	const timerId = setInterval(()=>{
		setDate(new Date)
	},1000)
	return ()=>{clearInterval(timerId)}
})

moment.locale('de');
let formatDate = moment().format("dddd-MMMM-D-H-mm-ss-a").split("-")
let secProgress = formatDate[5] / 60
let minProgress = (formatDate[4]) / 60
let hourProgress = (-formatDate[3] % 12) / 12
let dayProgress = (formatDate[2]) / 31

return (
<div id="clock" className="progress-clock">
	<div className="progress-clock__time-date">
		<small data-unit="w">{formatDate[0]}</small><br/>
		<span data-unit="d">{formatDate[2]}. </span>
		<span data-unit="mo">{formatDate[1]}</span>
	</div>
	
	<button className="progress-clock__time-digit" data-unit="h" data-group="h" type="button">
		{formatDate[3]}
	</button>
	
	<span className="progress-clock__time-colon">:</span><br/>
	
	<button className="progress-clock__time-digit" data-unit="m" data-group="m" type="button">
		{formatDate[4]}
	</button>
	
	<span className="progress-clock__time-colon">:</span>
	
	<button className="progress-clock__time-digit" data-unit="s" data-group="s" type="button">
		{formatDate[5]}
	</button>
	
	<svg className="progress-clock__rings" width="256" height="256" viewBox="0 0 256 256">
		<defs>
			<linearGradient id="pc-yellow" x1="1" y1="0.5" x2="0" y2="0.5">
				<stop offset="0%" stopColor="hsl(43,90%,55%)" />
				<stop offset="100%" stopColor="hsl(23,90%,55%)" />
			</linearGradient>
			<linearGradient id="pc-blue" x1="1" y1="0.5" x2="0" y2="0.5">
				<stop offset="0%" stopColor="hsl(223,90%,55%)" />
				<stop offset="100%" stopColor="hsl(203,90%,55%)" />
			</linearGradient>
			<linearGradient id="pc-purple" x1="1" y1="0.5" x2="0" y2="0.5">
				<stop offset="0%" stopColor="hsl(283,90%,55%)" />
				<stop offset="100%" stopColor="hsl(263,90%,55%)" />
			</linearGradient>
		</defs>
		
		<g data-units="h">
			<circle className="progress-clock__ring" cx="128" cy="128" r="90" fill="none" opacity="0.1" stroke="#e79742" strokeWidth="12" />
			<circle className="progress-clock__ring-fill" data-ring="d" cx="128" cy="128" r="90" fill="none" stroke="#e79742" strokeWidth="12" strokeDasharray="565.5 565.5" strokeDashoffset={1-(1-hourProgress)*565.5} strokeLinecap="round" transform="rotate(-90,128,128)" />
		</g>
		
		<g data-units="m">
			<circle className="progress-clock__ring" cx="128" cy="128" r="106" fill="none" opacity="0.1" stroke="#4483ec" strokeWidth="12" />
			<circle className="progress-clock__ring-fill" data-ring="h" cx="128" cy="128" r="106" fill="none" stroke="#4483ec" strokeWidth="12" strokeDasharray="666 666" strokeDashoffset={(1-minProgress)*666} strokeLinecap="round" transform="rotate(-90,128,128)" />
		</g>
		
		<g data-units="s">
			<circle className="progress-clock__ring" cx="128" cy="128" r="122" fill="none" opacity="0.1" stroke="#8f30eb" strokeWidth="12" />
			<circle className="progress-clock__ring-fill" data-ring="m" cx="128" cy="128" r="122" fill="none" stroke="#8f30eb" strokeWidth="12" strokeDasharray="766.5 766.5" strokeDashoffset={(1-secProgress)*766.5} strokeLinecap="round" transform="rotate(-90,128,128)" />
		</g>
	</svg>
</div>

)
```

# Preview

`jsx:<ColorfulClock/>`

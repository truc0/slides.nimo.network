const { exec } = require('child_process')
const fs = require('fs')
const path = require('path')

const directory = __dirname
const dist = path.join(__dirname, 'dist')
const toc = path.join(__dirname, 'toc.md')

const buildSlides = () => {
    const slideFilenames = fs.readdirSync(directory).filter(item => {
        if (!item.startsWith('lesson-') || !item.endsWith('.md')) return false
        if (fs.statSync(item).isDirectory()) return false
        return true
    })

    slideFilenames.forEach(filename => {
        // extract lession number
        const slideName = filename.replace(".md", "")
        const command = `yarn build ${filename} --out ${dist}/${slideName} --base /${slideName}/`
        console.log(command)
        exec(command, (error, stdout, stderr) => {
            if (error) {
                console.error(error)
                console.error(stderr)
            } else {
                console.log(stdout)
            }
        })
    })
}

// clean up dist
if (fs.existsSync(dist)) {
    fs.rmSync(dist, { force: true, recursive: true })
}

// build toc first
exec(`yarn build toc.md`, (error, stdout, stderr) => {
    if (error) console.error(error)
    if (stderr) console.error(stderr)
    console.log(stdout)

    // must run after toc built
    buildSlides()
})
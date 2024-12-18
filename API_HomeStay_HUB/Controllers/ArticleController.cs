using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Mvc;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly IArticleService _service;
        private readonly DBContext db;

        public ArticleController(IArticleService service , DBContext db)
        {
            _service = service;
            this.db = db;
        }

        // GET: api/Article
        [HttpGet("getAll")]
        public async Task<ActionResult<IEnumerable<Article>>> GetArticles()
        {
            return Ok(await _service.GetAllArticles());
        }

        // GET: api/Article
        [HttpGet("getNew")]
        public async Task<ActionResult<IEnumerable<Article>>> getNew()
        {
            return Ok(db.Articles.Take(8).ToList().OrderByDescending(s=>s.PublishDate));
        }


        // GET: api/Article/5
        [HttpGet("getByID{id}")]
        public async Task<IActionResult> GetArticle(int id)
        {
            var article = await _service.GetArticleById(id);
            if (article == null)
            {
                return NotFound();
            }
            return Ok(article);
        }


        [HttpGet("getByCateArticle/{id}")]
        public async Task<IActionResult> getArticle_ByCate(int id)
        {
            var article = await _service.GetArticles_ByCate(id);
            if (article == null)
            {
                return NotFound();
            }
            return Ok(article);
        }

        // POST: api/Article
        [HttpPost("add")]
        public async Task<ActionResult<Article>> PostArticle([FromBody] Article article)
        {

            if (await _service.AddArticle(article))
            {
                return Ok("themt thanh cong");
            }
            return BadRequest("Thêm thất bại Article hãy kiểm tra lại dữ liệu");
        }

        // PUT: api/Article/5
        [HttpPut("update")]
        public async Task<IActionResult> PutArticle([FromBody] Article article)
        {
            if (await _service.UpdateArticle(article))
            {
                return Ok("update success");
            }
            return BadRequest("Cập nhật thất bại Article hãy kiểm tra lại dữ liệu");
        }

        // DELETE: api/Article/5
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteArticle(int id)
        {
            if (await _service.DeleteArticle(id))
            {
                return Ok("delete sucess");
            }
            return NotFound();
        }

        // GET: api/Article/search?keyword=keyword
        [HttpGet("search")]
        public async Task<IActionResult> SearchArticles([FromQuery] string keyword)
        {
            var articles = await _service.SearchArticles(keyword);
            return Ok(articles);
        }
    }
}

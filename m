Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEF11DEB0
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Dec 2019 08:31:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 805D14203C7;
	Fri, 13 Dec 2019 08:31:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 366 seconds by postgrey-1.31 at mail19;
	Fri, 18 Oct 2019 17:28:39 CEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B3374202E7
	for <drbd-dev@lists.linbit.com>; Fri, 18 Oct 2019 17:28:39 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E74F668BFE; Fri, 18 Oct 2019 17:22:26 +0200 (CEST)
Date: Fri, 18 Oct 2019 17:22:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191018152226.GA32150@lst.de>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
	<20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:31:26 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
	Song Liu <songliubraving@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-afs@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Darren Hart <dvhart@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Robert Richter <rric@kernel.org>, Will Deacon <will@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-fbdev@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andy Whitcroft <apw@canonical.com>,
	Takashi Iwai <tiwai@suse.com>, bpf@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Karsten Keil <isdn@linux-pingi.de>,
	Tony Luck <tony.luck@intel.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sangbeom Kim <sbkim73@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
	Yonghong Song <yhs@fb.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	James Morse <james.morse@arm.com>,
	Corentin Chary <corentin.chary@gmail.com>, Joe Perches <joe@perches.com>,
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	Andy Shevchenko <andy@infradead.org>
Subject: Re: [Drbd-dev] [PATCH v2 00/33] Kill pr_warning in the whole linux
	code
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

As I said before: please just send Linus a scripted conversion after
the next -rc1.  There is no point in creating all this churn.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

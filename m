Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F75C24196
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:21:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 998A41627A8;
	Fri, 31 Oct 2025 10:20:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94B15160973
	for <drbd-dev@lists.linbit.com>; Sun, 26 Oct 2025 02:05:32 +0100 (CET)
Received: by mail-pf1-f169.google.com with SMTP id
	d2e1a72fcca58-78af743c232so3184916b3a.1
	for <drbd-dev@lists.linbit.com>; Sat, 25 Oct 2025 18:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1761440731; x=1762045531;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=N36vhbRkSG6GC2TdNjzZ1OMz+RKJl4mIAfGLbGj75+A=;
	b=AYYgCclAXkkDdS1z/BgyAVcPdt0zp6DrP6TFf9XYE3GwNkmMbS29rpubeWZClRobll
	dOfymqIid4Cvvs8CQw0yEr6loH4U8ZH0IccHYOKoxJ+5jrwY7tfrm3eQhvdvgICGebfF
	ZXdIrNl/P7U5UHHxE/6BwPWwASDDmGS9gJZb5ezNbAcKPr6kdYbOZvBCW/YsYZLyJUax
	NiX5zfgGMXFuaEzSD9bE4VP68oZ7NQZQD319XpK+XT510K1EIprowLJmE4fsM4FZ4tRj
	lk8iV7MpRcbiz9DM5siqVrXnnb+3B9mHEoo9+nHs16rDTQ0/UQq3NJCF2a7wPj2ysCni
	1mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761440731; x=1762045531;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=N36vhbRkSG6GC2TdNjzZ1OMz+RKJl4mIAfGLbGj75+A=;
	b=wLRDvBAKrkebQKCDC7NUxkgIyU711mlkmVJD52VnAwogps0OHkAtJZh8s/SzMYGafG
	NSAje9Xo890e2I7YYAhlFHsE4rxBFCHxW42OQybwA6QxiE7Pszc7/vJNvN4YZp8R74fX
	3SGAc+em7ClKi7QM3olz0f0469Pb4nsbf0l8Vz/THYpyvgV1Z1eXE3kpXi+bjiaGmJwl
	7JmEorU0uCsmK7PBPD7l4B43Eo9/6mPPJHdpP9IbvlGH04zWzf9ZIlFCWQPqJLZwsCX/
	gLUzdSbQ/Ws0g4REjTTtwaJSYx5OgLrNmC6vBbIuwXvVkDJ/22ivyin96UHCkU3ToWID
	kyGQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCXgF3VgWfPcSbYqWvaOhh69kXEiScAbOk7Ncrv5nQ8YqkBMM8br79uMDaS+mh7SR6vwbV1DJtntuA==@lists.linbit.com
X-Gm-Message-State: AOJu0YzzLIEjB9/GrxA3JGoC21LWjE8mjT6s6t944+qju9u+73muWYyZ
	EjM4fb217GMJicWGESRYqG0nZwGMDyglmdtuIkpnN4IGC+xG0El3eFJ3
X-Gm-Gg: ASbGncssWP2jhvEIGo97s4N44FpP2MwL5U9nCU5DMF5M4JutCyPvSZm3kfVAZe7pkZD
	M3ATW1tKgeMTZskAPF9T6YOFU9pjDq9j75DXM0olfjg5ALRe0x166Gl+Qi99r3eJJ0JNaEQEJ4f
	uE+TXmXKGEu2m9MaB0z0hrAltqAgcT6K+8FRvWBNBDsXcHlmNtOQaWIOOLm0blRp4UW07IwwnqH
	SXsVtBciCB9mSh1Z2KSVx82rgQ9BAkM3lXPO1vsl1sX4TbUI/aSCaG5futNH4U602Zk/PzwW7oc
	7BHf3wbk2G7YVjusR8XTKPxWCg9eoymN7C6owJFOYWptvBA5P51EWSriTLrhualtWDAaoi7oBan
	Ftjx0ngPekU+IeIyY4RgqiQgFKUz5N/X40y7hiILdBBiHa+Yl6EkCVRflhhOF+AbciwQ3XkAHo/
	DD3r4=
X-Google-Smtp-Source: AGHT+IFqnGHut/11Suj2FeTeWv27UHLAlLr0nFmnErIj4agIj4rm3uNWP4XEpAPa8D23/k1s6P6wnQ==
X-Received: by 2002:a05:6a21:4cc5:b0:340:6a50:7e9d with SMTP id
	adf61e73a8af0-3406a50809cmr6289528637.54.1761440731426; 
	Sat, 25 Oct 2025 18:05:31 -0700 (PDT)
Received: from daniel.. ([221.218.137.209]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7a41404987esm3371597b3a.36.2025.10.25.18.05.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Oct 2025 18:05:31 -0700 (PDT)
From: jinji zhong <jinji.z.zhong@gmail.com>
To: minchan@kernel.org, senozhatsky@chromium.org, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
	corbet@lwn.net, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
	axboe@kernel.dk, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, akpm@linux-foundation.org, terrelln@fb.com,
	dsterba@suse.com
Subject: [RFC PATCH 1/3] mm/memcontrol: Introduce per-cgroup compression
	priority
Date: Sun, 26 Oct 2025 01:05:08 +0000
Message-ID: <18d8e6b876ea3ae98bff710474423a9a530f4a8a.1761439133.git.jinji.z.zhong@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1761439133.git.jinji.z.zhong@gmail.com>
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: liulu.liu@honor.com, feng.han@honor.com, linux-doc@vger.kernel.org,
	muchun.song@linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	jinji zhong <jinji.z.zhong@gmail.com>, zhongjinji@honor.com,
	cgroups@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Android, applications have varying tolerance for decompression speed.
Background and lightweight applications tolerate slower decompression
better than large, foreground applications. They are suitable for
algorithms like ZSTD, which has a high compression ratio but slower
decompression. Other applications may prefer algorithms with faster
decompression.

This patch introduces a per-cgroup compression priority mechanism.
Different compression priorities map to different algorithms. This
allows administrators to select the appropriate compression algorithm
on a per-cgroup basis.
---
 include/linux/memcontrol.h | 19 +++++++++++++++++++
 mm/memcontrol.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 873e510d6f8d..a91670b8c469 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -228,6 +228,9 @@ struct mem_cgroup {
 
 	int swappiness;
 
+	/* The priority of the compression algorithm used by the cgroup. */
+	int comp_priority;
+
 	/* memory.events and memory.events.local */
 	struct cgroup_file events_file;
 	struct cgroup_file events_local_file;
@@ -523,6 +526,22 @@ static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *ob
 	return memcg;
 }
 
+#define DEF_COMP_PRIORITY 0
+
+/*
+* get_cgroup_comp_priority - Get the compression priority of the memcg
+* @page: Pointer to the page.
+* Returns the compression priority of the memcg the page belongs to.
+*/
+static inline int get_cgroup_comp_priority(struct page *page)
+{
+	struct mem_cgroup *memcg = folio_memcg(page_folio(page));
+	if (!memcg)
+		return DEF_COMP_PRIORITY;
+
+	return memcg->comp_priority;
+}
+
 /*
  * folio_memcg_kmem - Check if the folio has the memcg_kmem flag set.
  * @folio: Pointer to the folio.
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4deda33625f4..436cbc8ddcc2 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5356,6 +5356,31 @@ static int swap_events_show(struct seq_file *m, void *v)
 	return 0;
 }
 
+static int swap_comp_priority_show(struct seq_file *m, void *v)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
+
+	seq_printf(m, "%d\n", READ_ONCE(memcg->comp_priority));
+	return 0;
+}
+
+static ssize_t swap_comp_priority_write(struct kernfs_open_file *of,
+					  char *buf, size_t nbytes, loff_t off)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
+	int comp_priority;
+	ssize_t parse_ret = kstrtoint(strstrip(buf), 10, &comp_priority);
+
+	if (parse_ret)
+		return parse_ret;
+
+	if (comp_priority < 0)
+		return -EINVAL;
+
+	WRITE_ONCE(memcg->comp_priority, comp_priority);
+	return nbytes;
+}
+
 static struct cftype swap_files[] = {
 	{
 		.name = "swap.current",
@@ -5388,6 +5413,12 @@ static struct cftype swap_files[] = {
 		.file_offset = offsetof(struct mem_cgroup, swap_events_file),
 		.seq_show = swap_events_show,
 	},
+	{
+		.name = "swap.comp_priority",
+		.flags = CFTYPE_NOT_ON_ROOT,
+		.seq_show = swap_comp_priority_show,
+		.write = swap_comp_priority_write,
+	},
 	{ }	/* terminate */
 };
 
-- 
2.48.1

